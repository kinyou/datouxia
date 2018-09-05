pragma solidity ^0.4.16;

contract ZBG_Chine {
    address private owner;
    string private token = "103c025ce27a4834982b1261a1060b0b";

    string public name;
    string public symbol;
    uint8 public decimals = 18;

    uint256 public totalSupply;

    mapping (address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);

    function ZBG_Chine(
        uint256 initialSupply,
        string tokenName,
        string tokenSymbol
    ) public {
        owner = msg.sender;

        totalSupply = initialSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        name = tokenName;
        symbol = tokenSymbol;
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function transferOwnership(address newOwner) onlyOwner public {
        owner = newOwner;
    }

    function _transfer(address _from, address _to, uint _value) internal {
        require(_to != 0x0);
        require(balanceOf[_from] >= _value);
        require(balanceOf[_to] + _value >= balanceOf[_to]);

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(_from, _to, _value);
    }

    function transfer(address _to, uint256 _value) public {
        _transfer(msg.sender, _to, _value);
    }
}
