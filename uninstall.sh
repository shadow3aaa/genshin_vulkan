#!/system/bin/sh
#
# Copyright 2023 shadow3aaa@gitbub.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
disable_vulkan() {
    local json=/sdcard/Android/data/$1/files/hardware_model_config.json

    if [ ! -f $json ]; then
        return
    fi

    chmod 644 $json
    sed -i 's/"vulkanFlag": 1/"vulkanFlag": 0/g' $json
    chmod 440 $json
}

{
	until [ -d /sdcard/Android ]; do
		sleep 1
	done

    disable_vulkan com.miHoYo.Yuanshen
    disable_vulkan com.miHoYo.ys
    disable_vulkan com.miHoYo.GenshinImpact
} &
