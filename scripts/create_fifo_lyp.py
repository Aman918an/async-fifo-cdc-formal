import xml.etree.ElementTree as ET

layers = [
    # Metal layers
    ("Metal1", 11, "#4FC3F7"),
    ("Metal2", 13, "#FF6B6B"),
    ("Metal3", 15, "#66BB6A"),
    ("Metal4", 17, "#FFD166"),
    ("Metal5", 19, "#B388FF"),
    ("Metal6", 21, "#FF9F43"),
    ("Metal7", 23, "#26C6DA"),

    # Via layers
    ("Via1", 12, "#90CAF9"),
    ("Via2", 14, "#EF9A9A"),
    ("Via3", 16, "#A5D6A7"),
    ("Via4", 18, "#FFE082"),
    ("Via5", 20, "#CE93D8"),
    ("Via6", 22, "#FFCC80"),

    # Boundary
    ("Boundary", 235, "#FFFFFF"),
]

root = ET.Element("layer-properties")

for name, layer, color in layers:
    props = ET.SubElement(root, "properties")

    values = {
        "name": name,
        "source": f"{layer}/0@1",
        "frame-color": color,
        "fill-color": color,
        "frame-brightness": "0",
        "fill-brightness": "0",
        "dither-pattern": "I0",
        "line-style": "",
        "valid": "true",
        "visible": "true",
        "transparent": "false",
        "width": "1",
        "marked": "false",
        "xfill": "false",
        "animation": "0",
    }

    for key, value in values.items():
        ET.SubElement(props, key).text = value

# Hidden process/text layers
for name, layer in [
    ("Diffusion", 1),
    ("PWell", 2),
    ("NWell", 3),
    ("NImplant", 4),
    ("PImplant", 5),
    ("Poly", 9),
    ("Contact", 10),
]:
    props = ET.SubElement(root, "properties")
    for key, value in {
        "name": name,
        "source": f"{layer}/0@1",
        "frame-color": "#777777",
        "fill-color": "#777777",
        "visible": "false",
        "valid": "true",
    }.items():
        ET.SubElement(props, key).text = value

ET.indent(root, space="  ")

output = "async_fifo_custom.lyp"
ET.ElementTree(root).write(
    output, encoding="UTF-8", xml_declaration=True
)

print(f"Created {output}")
