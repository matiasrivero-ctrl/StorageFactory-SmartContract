// Identificador de licensia
// SPDX-License-Identifier: MIT

// Versión del lenguaje que utilizamos.
// Cualquier version hacía una superior se marcar con ^
// Setear una versión entre versiones se anota >=0.x.x <0.9.x
pragma solidity ^0.8.0;

/* 
 // Types:
    //  -> boolean, uint, int, address, bytes
    bool hasFavoriteNumber = false;
    uint favoriteNumber = 123; // default uint256
    int favoriteNumberTwo = 2;
    string favoriteString = "Hola"; // Secretamente bytes pero para strings
    address myAddress = 0x47a4B7C89e421Ce2902197d910754D8564f914A3;
    bytes32 favoriteBytes = "Cat"; // bytes32 es el máximo no existe un numero mayor a 32.
*/

// Definiendo el contrato
// Similar a una clase
contract SimpleStorage {
    // Se inicia en 0
   uint256 favoriteNumber; // default es internal

    // Mappings
    mapping(string => uint256) public nameToFavoriteNumber;

    // Arrays & Struct
    // Esto es un objeto
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    //  -> La mejor forma de crear una lista es usando Arrays
    //  --> Los arrays son estructuras de codigo que sirven para almacenar una lista de otros types
    
    // Dynamic Array 
    People[] public people;

   // Funciones
   // Cambia el valor de favoriteNumber a otro.
        // Visibilidad
        // -> Public, Private, External, Internal
        /* 
            Public: variable public ejecuta una funcion para que retorne el valor.
            Private: solamente visible en el contrato actual
            External: alguien desde fuera del contrato puede llamar a la variable
            Internal: solamente lo pueden llamar desde dentro del contrato o los contratos hijos
        */
   function store(uint256 _favoriteNumber) public virtual {
       favoriteNumber = _favoriteNumber;
        // cuanto más operaciones haga tu smart contract, más gas va a costar.
        // -> favoriteNumber = _favoriteNumber + 1;
   }


    // view, pure: cuando las llamas por separado no gastan gas, no permite una modificacion del state
    // pure: además, no permite leer desde el state de la blockchain
   function retrieve() public view returns(uint256) {
       return favoriteNumber;
   }

    // Funcion que agrega personas al array People
   function addPerson(string memory _name, uint256 _favoriteNumber) public {
       People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
       people.push(newPerson);
       nameToFavoriteNumber[_name] = _favoriteNumber;
   }

   /* Memory, Storage, Calldata (Intro) 
        memory: data que puede ser modificada pero almacenada temporalmente.
        calldata: data que no puede ser modificada pero la almacena temporalmente.
        storage: data que puede ser modificada pero la almacena permanentamente.
    */
    
}
