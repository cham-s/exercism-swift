import XCTest
@testable import RobotSimulator

class RobotSimulatorTests: XCTestCase {
    var robot = SimulatedRobot()
    
    func testRobotBearingEast() {
        robot.orient(.east)
        XCTAssertEqual([Orientation.east], [robot.bearing])
    }
    
    func testRobotBearingWest() {
        robot.orient(.west)
        XCTAssertEqual([Orientation.west], [robot.bearing])
    }
    
    func testRobotBearingNorth() {
        robot.orient(.north)
        XCTAssertEqual([Orientation.north], [robot.bearing])
    }
    
    func testRobotBearingSouth() {
        robot.orient(.south)
        XCTAssertEqual([Orientation.south], [robot.bearing])
    }
    
    func testTurnRightFromNorth() {
        robot.orient(.north)
        robot.turnRight()
        XCTAssertEqual([Orientation.east], [robot.bearing])
    }
    
    func testTurnRightFromEast() {
        robot.orient(.east)
        robot.turnRight()
        XCTAssertEqual([Orientation.south], [robot.bearing])
    }
    
    func testTurnRightFromSouth() {
        robot.orient(.south)
        robot.turnRight()
        XCTAssertEqual([Orientation.west], [robot.bearing])
    }
    
    func testTurnRightFromWest() {
        robot.orient(.west)
        robot.turnRight()
        XCTAssertEqual([Orientation.north], [robot.bearing])
    }
    
    func testTurnLeftFromNorth() {
        robot.orient(.north)
        robot.turnLeft()
        XCTAssertEqual([Orientation.west], [robot.bearing])
    }
    
    func testTurnLeftFromEast() {
        robot.orient(.east)
        robot.turnLeft()
        XCTAssertEqual([Orientation.north], [robot.bearing])
    }
    
    func testTurnLeftFromSouth() {
        robot.orient(.south)
        robot.turnLeft()
        XCTAssertEqual([Orientation.east], [robot.bearing])
    }
    
    func testTurnLeftFromWest() {
        robot.orient(.west)
        robot.turnLeft()
        XCTAssertEqual([Orientation.south], [robot.bearing])
    }
    
    func testRobotCoordinates() {
        robot.at(x: 3, y: 0)
        let coordinates = (x: 3, y: 0)
        XCTAssertTrue(coordinates == robot.coordinates)
    }
    
    func testOtherRobotCoordinates() {
        robot.at(x: -2, y: 5)
        let coordinates = (x: -2, y: 5)
        XCTAssertTrue(coordinates == robot.coordinates)
    }
    
    func testAdvanceWhenFacingNorth() {
        robot.at(x: 0, y: 0)
        robot.orient(.north)
        robot.advance()
        let coordinates = (x: 0, y: 1)
        XCTAssertTrue(coordinates == robot.coordinates)
    }
    
    func testAdvanceWhenFacingEast() {
        robot.at(x: 0, y: 0)
        robot.orient(.east)
        robot.advance()
        let coordinates = (x: 1, y: 0)
        XCTAssertTrue(coordinates == robot.coordinates)
    }
    
    func testAdvanceWhenFacingSouth() {
        robot.at(x: 0, y: 0)
        robot.orient(.south)
        robot.advance()
        let coordinates = (x: 0, y: -1)
        XCTAssertTrue(coordinates == robot.coordinates)
    }
    
    func testAdvanceWhenFacingWest() {
        robot.at(x: 0, y: 0)
        robot.orient(.west)
        robot.advance()
        let coordinates = (x: -1, y: 0)
        XCTAssertTrue(coordinates == robot.coordinates)
    }
    
    func testInstructionForTurningLeft() {
        XCTAssertEqual([Instruction.turnLeft], robot.instructions("L"))
    }
    
    func testInstructionForTurningRight() {
        XCTAssertEqual([Instruction.turnRight], robot.instructions("R"))
    }
    
    func testInstructionForAdvancing() {
        XCTAssertEqual([Instruction.advance], robot.instructions("A"))
    }
    
    func testSeriesOfInstructions() {
        XCTAssertEqual([Instruction.turnRight, Instruction.advance, Instruction.advance, Instruction.turnLeft], robot.instructions("RAAL"))
    }
    
    func testInstructRobot() {
        var robot = SimulatedRobot()
        robot.place(x: -2, y: 1, direction: .east)
        robot.evaluate("RLAALAL")
        
        let coordinates = (x: 0, y: 2)
        XCTAssertTrue(coordinates == robot.coordinates)
        XCTAssertEqual([Orientation.west], [robot.bearing])
    }
    
    func testInstructManyRobots() {
        var robot1 = SimulatedRobot()
        var robot2 = SimulatedRobot()
        var robot3 = SimulatedRobot()
        robot1.place(x: 0, y: 0, direction: .north)
        robot2.place(x: 2, y: -7, direction: .east)
        robot3.place(x: 8, y: 4, direction: .south)
        robot1.evaluate("LAAARALA")
        robot2.evaluate("RRAAAAALA")
        robot3.evaluate("LAAARRRALLLL")
        
        var coordinates = (x: -4, y: 1)
        XCTAssertTrue(coordinates == robot1.coordinates)
        XCTAssertEqual([Orientation.west], [robot1.bearing])
        
        coordinates = (x: -3, y: -8)
        XCTAssertTrue(coordinates == robot2.coordinates)
        XCTAssertEqual([Orientation.south], [robot2.bearing])
        
        coordinates = (x: 11, y: 5)
        XCTAssertTrue(coordinates == robot3.coordinates)
        XCTAssertEqual([Orientation.north], [robot3.bearing])
    }


    static var allTests: [(String, (RobotSimulatorTests) -> () throws -> Void)] {
        return [
            ("testRobotBearingEast", testRobotBearingEast),
            ("testRobotBearingWest", testRobotBearingWest),
            ("testRobotBearingNorth", testRobotBearingNorth),
            ("testRobotBearingSouth", testRobotBearingSouth),
            ("testTurnRightFromNorth", testTurnRightFromNorth),
            ("testTurnRightFromEast", testTurnRightFromEast),
            ("testTurnRightFromSouth", testTurnRightFromSouth),
            ("testTurnRightFromWest", testTurnRightFromWest),
            ("testTurnLeftFromNorth", testTurnLeftFromNorth),
            ("testTurnLeftFromEast", testTurnLeftFromEast),
            ("testTurnLeftFromSouth", testTurnLeftFromSouth),
            ("testTurnLeftFromWest", testTurnLeftFromWest),
            ("testRobotCoordinates", testRobotCoordinates),
            ("testOtherRobotCoordinates", testOtherRobotCoordinates),
            ("testAdvanceWhenFacingNorth", testAdvanceWhenFacingNorth),
            ("testAdvanceWhenFacingEast", testAdvanceWhenFacingEast),
            ("testAdvanceWhenFacingSouth", testAdvanceWhenFacingSouth),
            ("testAdvanceWhenFacingWest", testAdvanceWhenFacingWest),
            ("testInstructionForTurningLeft", testInstructionForTurningLeft),
            ("testInstructionForTurningRight", testInstructionForTurningRight),
            ("testInstructionForAdvancing", testInstructionForAdvancing),
            ("testSeriesOfInstructions", testSeriesOfInstructions),
            ("testInstructRobot", testInstructRobot),
            ("testInstructManyRobots", testInstructManyRobots),
        ]
    }
}
