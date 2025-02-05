pragma solidity 0.5.11;

import "ds-thing/thing.sol";

interface MedianizerLike {
    function poke() external;
}

contract PriceFeed is DSThing {

    uint128       val;
    uint32 public zzz;

    function peek() external view returns (bytes32,bool)
    {
        return (bytes32(uint(val)), now < zzz);
    }

    function read() external view returns (bytes32)
    {
        require(now < zzz);
        return bytes32(uint(val));
    }

    function poke(uint128 val_, uint32 zzz_) external note auth
    {
        val = val_;
        zzz = zzz_;
    }

    function post(uint128 val_, uint32 zzz_, MedianizerLike med_) external note auth
    {
        val = val_;
        zzz = zzz_;
        med_.poke();
    }

    function void() external note auth
    {
        zzz = 0;
    }

}
