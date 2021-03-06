identification division.
program-id. MarsRover.

data division.
working-storage section.
copy GridDimensions
    replacing GridDimensions by ==GridDimensions is global==.
copy RoverPosition
    replacing RoverPosition by ==RoverPosition is global==.

local-storage section.
01 CurrentInstruction pic 99.
    88 EndOfSequence value 99.

linkage section.
01 Command   pic x any length.
01 Parameter pic x any length.

procedure division using Command, Parameter.
Main section.
    evaluate function trim(Command)
        when equals "SetGridSize" move Parameter to GridDimensions
        when equals "GetGridSize" move GridDimensions to Parameter
        when equals "GetRoverPosition" move RoverPosition to Parameter
        when equals "SelectRover" move Parameter to RoverPosition
        when equals "MoveRover" call "MoveMarsRover" using Parameter
    end-evaluate.
    goback
    .

program-id. MoveMarsRover.

data division.
working-storage section.
01 CurrentInstruction pic 99.
    88 EndOfSequence value 99.

linkage section.
01 MoveSequence pic x any length.

procedure division using MoveSequence.
Main section.
    perform with test after varying CurrentInstruction from 1 by 1 until EndOfSequence
        evaluate MoveSequence(CurrentInstruction:1) also true
            when "L" also OrientationIsNorth set OrientationIsWest to true
            when "L" also OrientationIsWest  set OrientationIsSouth to true
            when "L" also OrientationIsSouth set OrientationIsEast to true
            when "L" also OrientationIsEast  set OrientationIsNorth to true
            when "R" also OrientationIsNorth set OrientationIsEast to true
            when "R" also OrientationIsEast  set OrientationIsSouth to true
            when "R" also OrientationIsSouth set OrientationIsWest to true
            when "R" also OrientationIsWest  set OrientationIsNorth to true
            when "M" also OrientationIsNorth if YPos < MaxY add 1 to YPos
            when "M" also OrientationIsSouth if YPos > 0 subtract 1 from YPos
            when "M" also OrientationIsEast  if XPos < MaxX add 1 to XPos
            when "M" also OrientationIsWest  if XPos > 0 subtract 1 from XPos
            when other set EndOfSequence to true
        end-evaluate
    end-perform
    exit program
    .

end program MoveMarsRover.
end program MarsRover.
