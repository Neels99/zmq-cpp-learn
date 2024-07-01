#include <iostream>
#include <chrono>
#include <thread>
#include <boost/asio.hpp>
#include <zmq.hpp>

template <typename F>
boost::asio::steady_timer create_timer(boost::asio::io_context& ctx, std::chrono::seconds sec, F&& func)
{
    boost::asio::steady_timer timer(ctx, sec);
    timer.async_wait(
        [func](const boost::system::error_code& ec)
        {
            func();
        }
    );

    return std::move(timer);
}

void zmq_thread()
{
    zmq::context_t context(1);

    // Сокет для ответов
    zmq::socket_t responder(context, ZMQ_REP);
    responder.bind("tcp://*:5555");

    // Сокет для запросов
    zmq::socket_t requester(context, ZMQ_REQ);
    requester.connect("tcp://localhost:5555");
}

void main()
{
    std::thread zmq_th{zmq_thread};

    using namespace std::chrono_literals;
    boost::asio::io_context ctx;

    auto t1 = create_timer(ctx, 1s, []{ std::cout << "1" << std::endl; });
    auto t2 = create_timer(ctx, 3s, []{ std::cout << "2" << std::endl; });

    ctx.run();

    zmq_th.join();
}