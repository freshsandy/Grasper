#ifndef LABEL_INDEX_KEY_EXPERT_HPP_
#define LABEL_INDEX_EXPERT_HPP_

#include <string>
#include <vector>
#include <algorithm>
#include <map>
#include "base/type.hpp"
#include "storage/layout.hpp"
#include "storage/data_store.hpp"
#include "utils/tool.hpp"
#include "core/index_store.hpp"
#include "core/abstract_mailbox.hpp"
#include "core/result_collector.hpp"
#include "base/node.hpp"
#include "expert/abstract_expert.hpp"
#include "utils/tool.hpp"

using namespace std;
//params type and vid
class label_index_expert : public AbstractExpert{
public:
    label_index_expert(int id, DataStore * data_store, int num_thread, AbstractMailbox * mailbox, CoreAffinity* core_affinity, IndexStore * index_store) : AbstractExpert(id, data_store, core_affinity), num_thread_(num_thread), mailbox_(mailbox), index_store_(index_store), type_(EXPERT_T::ADJACENTINDEX) {}
    void process(const vector<Expert_Object> & expert_objs, Message & msg) {
        int tid = TidMapper::GetInstance()->GetTid();

        // Get Expert_Object
        Meta & m = msg.meta;
        Expert_Object expert_obj = expert_objs[m.step];

        // Get Params
        assert(expert_obj.params.size() == 2);  // make sure input format
        Element_T inType = (Element_T) Tool::value_t2int(expert_obj.params[0]);

        value_t value =expert_obj.params[1];
        vid_t vid(Tool::value_t2int(&value));

        bool enabled = false;
        if(inType!=Element_T::VERTEX) {
            cout << "Wrong inType" << endl;
            return;
        }
        enabled = build_edge_index(vid,tid);

        string ena = (enabled? "enabled":"disabled");
        string s = "Adjecnt Index is " + ena + " in node" + to_string(m.recver_nid);
        value_t v;
        Tool::str2str(s, v);
        msg.data.emplace_back(history_t(), vector<value_t>{v});
        // Create Message
        vector<Message> msg_vec;
        msg.CreateNextMsg(expert_objs, msg.data, num_thread_, data_store_, core_affinity_, msg_vec);

        // Send Message
        for (auto& msg : msg_vec) {
            mailbox_->Send(tid, msg);
        }
    }
    DataStore* data_store_;
    index_store* indexStore;
    // Number of Threads
    int num_thread_;

    // Expert type
    EXPERT_T type_;

    // Pointer of mailbox
    AbstractMailbox * mailbox_;
private:
    bool build_edge_index(vid_t vid,int tid){
        unordered_map<label_t,vector<pid_t>> in_map;
        unordered_map<label_t,vector<pid_t>> out_map;

        Vertex* vtx = data_store_->GetVertex(vid);//get the central vertex

        for(auto& vid_ : vtx->out_nbs ){  //sort the out_list group by label
            label_t label;
            eid_t e_id(vid.value(),vid_.value());
            data_store_->GetLabelForEdge(tid, e_id, label);
            unordered_map<label_t,vector<vid_t>>::iterator iter;
            iter = out_map.find(label);
            if(iter==out_map.end()){  //not find
                vector<vid_t> v_list;
                v_list.insert(vid_);
                out_map.insert(make_pair(label,v_list));
            }else{
                iter->second.insert(vid_);
            }
        }

        for(auto& vid_ : vtx->in_nbs ){  // sort the in_list
            label_t label;
            eid_t e_id(vid.value(),vid_.value());
            data_store_->GetLabelForEdge(tid, e_id, label);
            unordered_map<label_t,vector<vid_t>>::iterator iter;
            iter = in_map.find(label);
            if(iter==in_map.end()){  //not find
                vector<vid_t> v_list;
                v_list.insert(vid_);
                in_map.insert(make_pair(label,v_list));
            }else{
                iter->second.insert(vid_);
            }
        }
        return indexStore->setAdjacentIndex(in_map,out_map,vid);

        }
    }
};

#endif /*LABEL_INDEX_EXPERT*/