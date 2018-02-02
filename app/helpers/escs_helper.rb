module EscsHelper
  def battery_type(esc)
  battery = ""
    if esc.lipo.present?
      battery = "Li-Po #{esc.lipo}・"
    end
    if esc.life.present?
      battery = battery + "Li-Fe #{esc.life}・"
    end
    if esc.nimh.present?
      battery = battery + "Ni-Mh #{esc.nimh}・"
    end
    if esc.nicd.present?
      battery = battery + "Ni-Co #{esc.nimh}"
    end
    return battery
  end
end
