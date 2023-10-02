// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
 
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol"; 
 
contract Helium is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
 
    Counters.Counter private _tokenIdCounter;
 
    constructor() ERC721("Helium", "HEM") {}

     function supportsInterface (bytes4 interfaceId) public view virtual override(ERC721, ERC721URIStorage) returns(bool){
        return super.supportsInterface(interfaceId);
     }

    function _beforeTokenTransfer(address from, address to, uint256 tokenId, uint256 batchSize)
        internal
        override(ERC721)
    {
        require(from == address(0), "Token not transferable");
        super._beforeTokenTransfer(from, to, tokenId, batchSize);
    }
 
    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }
 
    // The following functions are overrides required by Solidity.
 
    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function setTokenURI(uint256 tokenId, string memory _tokenURI) public {
        super._setTokenURI(tokenId, _tokenURI);
    }
 
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}