
function  goldenSectionSearch(functionToMinimise,a,b,tolerance)

% Check that the correct number of input arguments have been passed to the
% function (this is not essential, but it helps to detect user error)

if (nargin ~= 4)     % in Matlab the operator ~= means "not equal to"
    error('four input arguments are required')
end

% Check that input parameters have appropriate values

    if(b <= a)
        error('b must be strictly greater than a')    
    end
    
    if(tolerance <= 0)
        error('tolerance must be strictly positive')
    end

% begin the Golden Search algorithm

gamma = (sqrt(5) - 1)/2;  

k = 1;

p = b - gamma*(b-a);
q = a + gamma*(b-a);

fp = feval(functionToMinimise,p);
fq = feval(functionToMinimise,q);

Iter = [k, a,b,F(a),F(b)]


while ( (b-a) >= 2*tolerance) 
    
    k = k + 1;
    
    if (fp <= fq) 
        
        b = q;
        q = p;
        fq = fp;
        
        p = b - gamma*(b-a);
        fp = feval(functionToMinimise,p);
        
    else   
    
        a = p;
        p = q;
        fp = fq;
        
        q = a + gamma*(b-a);
        fq = feval(functionToMinimise,q);
        
    end
    
    
    Iter = [Iter; [k, a,b,F(a),F(b)]]
    
   
end

 
    
    
    
    
    
    
    
    
    
    
    