# 2026-02-04T17:16:30.947025600
import vitis

client = vitis.create_client()
client.set_workspace(path="software")

platform = client.create_platform_component(name = "platform_matmul",hw_design = "$COMPONENT_LOCATION/../../hardware/hardware.platforms/design_1_wrapper.xsa",os = "standalone",cpu = "psu_cortexa53_0",domain_name = "standalone_psu_cortexa53_0",architecture = "64-bit",compiler = "gcc")

platform = client.get_component(name="platform_matmul")
status = platform.build()

comp = client.get_component(name="xuartps_hello_world_example")
comp.build()

status = platform.build()

comp.build()

