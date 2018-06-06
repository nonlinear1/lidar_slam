-- Copyright 2016 The Cartographer Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

VOXEL_SIZE = 5e-2

XY_TRANSFORM =  {
  translation = { 0., 0., 0. },
  rotation = { 0., -math.pi / 2., 0., },
}

XZ_TRANSFORM =  {
  translation = { 0., 0., 0. },
  rotation = { 0. , 0., -math.pi / 2, },
}

YZ_TRANSFORM =  {
  translation = { 0., 0., 0. },
  rotation = { 0. , 0., math.pi, },
}

options = {
  tracking_frame = "base_link",
  excluding_frame=" ", 
  pipeline = {
    {
      action = "min_max_range_filter",
      min_range = 0.1,
      max_range = 10,
    },
    {
      action = "dump_num_points",
    },

    -- Gray X-Rays. These only use geometry to color pixels.
--     {
--       action = "write_xray_image",
--       voxel_size = VOXEL_SIZE,
--       filename = "xray_yz_all",
--       transform = YZ_TRANSFORM,
--     },
--     {
--       action = "write_xray_image",
--       voxel_size = VOXEL_SIZE,
--       filename = "xray_xy_all",
--       transform = XY_TRANSFORM,
--     },
--     {
--       action = "write_xray_image",
--       voxel_size = VOXEL_SIZE,
--       filename = "xray_xz_all",
--       transform = XZ_TRANSFORM,
--     },
    
    {
      action = "write_ply",
      filename = "points.ply",
    },
    -- Now we recolor our points by frame and write another batch of X-Rays. It
    -- is visible in them what was seen by the horizontal and the vertical
    -- laser.
    {
      action = "color_points",
      frame_id = "horizontal_vlp16_link",
      color = { 255., 0., 0. },
    },
    {
      action = "color_points",
      frame_id = "vertical_vlp16_link",
      color = { 0., 255., 0. },
    },

--     {
--       action = "color_points",
--       frame_id = "vertical_vlp16_link",
--       color = { 0., 255., 0. },
--     },

--     {
--       action = "write_xray_image",
--       voxel_size = VOXEL_SIZE,
--       filename = "xray_yz_all_color",
--       transform = YZ_TRANSFORM,
--     },
--     {
--       action = "write_xray_image",
--       voxel_size = VOXEL_SIZE,
--       filename = "xray_xy_all_color",
--       transform = XY_TRANSFORM,
--     },
--     {
--       action = "write_xray_image",
--       voxel_size = VOXEL_SIZE,
--       filename = "xray_xz_all_color",
--       transform = XZ_TRANSFORM,
--     },
  }
}

return options