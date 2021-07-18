// SPDX-License-Identifier: MIT

pragma solidity 0.8.6;

contract TodoContract {
    struct Todo {
        uint256 id;
        string name;
        string description;
    }

    Todo[] todos;
    uint256 nextId;

    function createTodo(string memory _name, string memory _description)
        public
    {
        todos.push(Todo(nextId, _name, _description));
        nextId++;
    }
}
