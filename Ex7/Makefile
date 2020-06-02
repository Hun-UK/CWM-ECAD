all: sim

sim:
	@echo "Starting test, this may take a minute..."
	@echo "Log is written to run.log. Use \"cat run.log\" to print the log on screen."	
	@vivado -mode batch -source project.tcl > run.log
	@egrep "PASSED|FAILED|ERROR" run.log

simgui: 
	@echo "Starting GUI test, this may take a minute..."
	@echo "Log is written to run.log. Use \"cat run.log\" to print the log on screen."	
	@vivado -mode gui -source project.tcl > run.log
	@egrep "PASSED|FAILED|ERROR" run.log

clean:
	@rm vivado*.* run.log
	@rm -r Ex*.*
