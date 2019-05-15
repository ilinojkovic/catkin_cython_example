#pragma once

namespace example_a
{

class A
{
public:
    int val_;

    A(int val) : val_(val) {}

    int get() const
    {
        return val_;
    }
};

}
