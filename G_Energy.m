function H=G_Energy(A)
% energy of a graph 
% A is a symmetric adjacency matrix
% developted by Amirhossein Ghaderi
% Cite: Ghaderi, A. H., Baltaretu, B. R., Andevari, M. N., Bharmauria, V., & Balci, F. (2020). 
% Synchrony and complexity in state-related EEG networks: an application of spectral graph theory. Neural Computation, 32(12), 2422-2454.

H=sum(abs(eig(A)));

end