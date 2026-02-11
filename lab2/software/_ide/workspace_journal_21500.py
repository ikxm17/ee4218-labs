# 2026-02-11T17:13:17.267828600
import vitis

client = vitis.create_client()
client.set_workspace(path="software")

platform = client.get_component(name="platform_matmul")
status = platform.build()

status = platform.build()

vitis.dispose()

