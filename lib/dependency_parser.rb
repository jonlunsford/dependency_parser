class DependencyParser
  attr_reader :collection

  def initialize(dependencies)
    @dependencies = dependencies.split
    @collection = []

    collect_dependencies
  end

  def to_string
    @collection.join(' ')
  end

  private

  def collect_dependencies
    until @collection.count == dependency_tree.keys.count
      dependency_tree.each_pair do |dep, array|
        next if @collection.include?(dep)
        @collection << dep if addable_to?(array)
      end
    end
  end

  def dependency_tree
    @dependency_tree ||= @dependencies.each.with_index.inject({}) do |hash, (dep, i)|
      hash[dep] = [] unless hash[dep]
      hash[dep] << @dependencies[i + 1] if even?(i)
      hash
    end
  end

  def addable_to?(array)
    array.empty? || array.all? { |value| @collection.include?(value) }
  end

  def even?(integer)
    integer % 2 == 0
  end
end
