function energy = find_energy(vector)
      [m, n] = size(vector);
      energy = zeros(m, n);
      for i = 1:m
          energy = energy + vector(i,:).^2;
      end
end