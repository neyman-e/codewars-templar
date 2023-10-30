describe("Sample tests") do
    it("Fight 1: Normal fights") do
        robot1 = {"name" => "Rocky", "health" => 100, "speed" => 20, "tactics" => ["punch", "punch", "laser", "missile"] }
        robot2 = {"name" => "Missile Bob", "health" => 100, "speed" => 21, "tactics" => ["missile", "missile", "missile", "missile"]}
        tactics = {"punch" => 20, "laser" => 30, "missile" => 35}
​
        Test.assert_equals(fight(robot1, robot2, tactics), "Missile Bob has won the fight.")
    end
​
    it("Fight 2: Rocky has more health.") do
        robot1 = {"name" => "Rocky", "health" => 200, "speed" => 20, "tactics" => ["punch", "punch", "laser", "missile"] }
        robot2 = {"name" => "Missile Bob", "health" => 100, "speed" => 21, "tactics" => ["missile", "missile", "missile", "missile"]}
        tactics = {"punch" => 20, "laser" => 30, "missile" => 35}
        Test.assert_equals(fight(robot1, robot2, tactics), "Rocky has won the fight.")
    end
end
