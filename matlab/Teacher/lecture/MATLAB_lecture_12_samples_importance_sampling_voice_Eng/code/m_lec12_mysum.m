function output = m_lec12_mysum(n)
sum = 0; i = 1;
sn = size(n);
while i <= sn(2)
    if ( n(i) == -1) break; end
    sum = sum + n(i); i = i + 1;
end
output = sum;


