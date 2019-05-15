#pragma once

namespace example_a_factory
{

std::shared_ptr<example_a::A> get_a(int val)
{
    std::shared_ptr<example_a::A> a = std::make_shared<example_a::A>(val);
    return a;
}

}
