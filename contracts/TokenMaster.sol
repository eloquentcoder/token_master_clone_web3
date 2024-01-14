// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract TokenMaster is ERC721 {

    address public owner;
    uint256 public totalOccasionsCount = 0;

    struct Occasion {
        uint256 id;
        string name;
        uint256 cost;
        uint256 tickets;
        uint256 maxTickets;
        string date;
        string time;
        string location;
    }

    mapping (uint256 => Occasion) occasions;

    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
        owner = msg.sender;
    }

    function list(
        string memory _name,
        uint256 _cost,
        uint256 _maxTickets,
        string memory _date,
        string memory _time,
        string memory _location
    ) public {
        totalOccasionsCount++;
        occasions[totalOccasionsCount] = Occasion(totalOccasionsCount, _name, _cost, _maxTickets, _maxTickets, _date, _time, _location);
    }

    function getOccasion(uint id) public view returns (Occasion memory) {
        Occasion memory occasion = occasions[id];
        return occasion;
    }


}
