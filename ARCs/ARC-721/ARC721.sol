// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./../../utils/Ownable.sol";

contract ARC721 is Ownable {
    using SafeMath for uint256;
    mapping(uint256 => string) private tokenURIs;
    string private _name;
    string private _symbol;
    uint256 private _tokenIdCounter;
    mapping(uint256 => address) private _tokenOwners;
    mapping(address => uint256) private _tokenBalances;

    constructor(string memory name, string memory symbol) {
        _name = name;
        _symbol = symbol;
        _tokenIdCounter = 0;
    }

    function name() external view returns (string memory) {
        return _name;
    }

    function symbol() external view returns (string memory) {
        return _symbol;
    }

    function balanceOf(address owner) external view returns (uint256) {
        return _tokenBalances[owner];
    }

    function totalSupply() external view returns (uint256) {
        return _tokenIdCounter;
    }

    function mintToken(address to) external {
        uint256 tokenId = _tokenIdCounter;
        _tokenOwners[tokenId] = to;
        _tokenBalances[to]++;
        _tokenIdCounter++;
    }

    function tokenMetadata(
        uint256 tokenId
    ) external view returns (string memory) {
        return tokenURIs[tokenId];
    }
}
