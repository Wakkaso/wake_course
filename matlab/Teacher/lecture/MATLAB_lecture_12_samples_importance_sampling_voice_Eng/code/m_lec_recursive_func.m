function output=m_lec_recursive_func(n)
if (n==0)
    output = 1;
else
    output = m_lec_recursive_func(n-1)*n;
end
end