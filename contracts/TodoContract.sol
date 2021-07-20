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

    // Crea tarea
    function createTodo(string memory _name, string memory _description) public {
        todos.push(Todo(nextId, _name, _description));
        nextId++;
    }

    // Obtiene todas las tareas
    function findTodo(uint256 _id) internal view returns (uint256) {
        for (uint256 i = 0; i < todos.length; i++) {
            if (todos[i].id == _id) {
                return i;
            }
        }
        revert("Todo not found");
    }

    // Actualiza tarea
    function updateTodo(uint256 _id, string memory _name, string memory _description) public {
        uint256 index = findTodo(_id);
        todos[index].name = _name;
        todos[index].description = _description;
    }

    // Leer tarea
    function readTodo(uint _id) public view returns (uint, string memory, string memory) {
        uint index = findTodo(_id);
        return (todos[index].id, todos[index].name, todos[index].description);
    }

    // "Elimina" tarea
    function deleteTodo(uint256 _id) public {
        uint256 index = findTodo(_id);
        delete todos[index];
    }
}
