# 2026-02-11T18:25:51.039312
import vitis

client = vitis.create_client()
client.set_workspace(path="software")

client.delete_component(name="xuartps_hello_world_example")

platform = client.create_platform_component(name = "platform_matmul",hw_design = "$COMPONENT_LOCATION/../../hardware/hardware.platforms/design_1_wrapper.xsa",os = "standalone",cpu = "psu_cortexa53_0",domain_name = "standalone_psu_cortexa53_0",architecture = "64-bit",compiler = "gcc")

platform = client.get_component(name="platform_matmul")
status = platform.build()

comp = client.get_component(name="xuartps_hello_world_example")
comp.build()

