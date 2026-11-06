# Power Distribution Network (PDN)

## Overview

The asynchronous FIFO ASIC implementation uses the standard-cell power distribution network configuration provided by the Nangate45 platform in OpenROAD-flow-scripts.

No custom project-specific PDN configuration was introduced.

## Power Grid Structure

The PDN uses three metal layers:

| Layer | Width (µm) | Pitch (µm) | Purpose |
|---|---:|---:|---|
| Metal1 | 0.17 | 2.4 | Standard-cell power rails |
| Metal4 | 0.48 | 55.2 | Intermediate power straps |
| Metal7 | 1.40 | 40.8 | Upper-level power straps |

The connection sequence is:

`Metal1 ↔ Metal4 ↔ Metal7`

## Power Nets

- Supply: VDD
- Ground: VSS

## Configuration Source

The implementation uses the Nangate45 platform template:

`flow/platforms/nangate45/template_pga.cfg`

The PDN is generated as part of the OpenROAD physical-design flow.

## Notes

The values documented above are taken from the Nangate45 platform configuration. They are not custom-optimized values for this FIFO design.
