$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'benchmark'
require "typograph"

include Benchmark
include Typograph


Benchmark.benchmark do |x|
  x.report("complex") do
    10_000.times do
      src = '"????-????" ??????? ????????? ? ???? ? 1979 ???? ?
      ???? ?????????? ??????????? ??? ? ??????. ?? ????? -
      ????????? ???? ???? ?????????, ?????? ?????? ????????????
      ????? ????????????!!!! ( ??? ??????? ??? ???????? ? 1886 ????
      ? ????? ???????? ) ? ?????? ?????-?? ?????....'

      Typograph.run(src)
    end
  end
end