all: project

project:
	@echo "Starting synthesis and implementation..."
	@vivado -mode batch -source project.tcl  

sim:
	@echo "Starting test, this may take a minute..."
	@echo "Log is written to run.log. Use \"cat run.log\" to print the log on screen."	
	@vivado -mode batch -source project_sim.tcl > run.log 
	@egrep "PASSED|FAILED|ERROR" run.log

simgui: 
	@echo "Starting GUI test, this may take a minute..."
	@echo "Log is written to run.log. Use \"cat run.log\" to print the log on screen."	
	@vivado -mode gui -source project_sim.tcl > run.log
	@egrep "PASSED|FAILED|ERROR" run.log

clean:
	@rm vivado*.* 
	@rm -r Ex*.*
