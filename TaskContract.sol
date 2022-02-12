// SPDX-License-Identifier: GPL-3.0
pragma solidity *0.8.11;

contract TaskContract {

    //string public message = 'Hello World';

    uint nextID = 1;

    struct Task {
        uint id;
        string name;
        string description;
    }

    Task[] tasks;

    function createTask (string memory _name, string memory _desc) public{
        tasks.push(Task(nextID, _name, _desc));
        nextID++;
    }

    /*function myNumber() public view returns (int){
        return n;
    }*/

    function findIndex(uint _id) internal view returns(uint){
        for(uint i = 0; i<tasks.length;i++){
            if(tasks[i].id==_id){
                return i;
            }
        }
        revert('Task not found');
    }

    function readTask(uint _id) public view returns (uint, string memory, string memory){
        uint index = findIndex(_id);
        return (tasks[index].id, tasks[index].name, tasks[index].description);
    }

}
