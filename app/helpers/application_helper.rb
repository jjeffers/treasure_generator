module ApplicationHelper

  def consolidate_containers(treasures)

    containers = {}

    treasures[:treasures].each do |treasure|
      if (containers.has_key?(treasure.container) and
        containers[treasure.container][:trapped_by].nil? and
        containers[treasure.container][:trapped_by].eql?(treasure.trapped_by) and
        containers[treasure.container][:hidden_by].nil? and 
        containers[treasure.container][:hidden_by].eql?(treasure.hidden_by))

        containers[treasure.container][:treasures] << treasure
      else
        containers[treasure.container] = { 
          :treasures => [treasure],
          :container => treasure.container,
          :hidden_by => treasure.hidden_by, 
          :trapped_by => treasure.trapped_by 
        }
      end
    end

    containers
  end

end
