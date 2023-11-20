def testing(n, res)
    Test.assert_equals(smallest(n), res)
end
​
Test.describe("smallest") do
  Test.it("Basic tests") do
    testing(261235, [126235, 2, 0]);
    testing(209917, [29917, 0, 1]);
    testing(285365, [238565, 3, 1]);
    testing(269045, [26945, 3, 0]);
    testing(296837, [239687, 4, 1]);
  end
end
​
