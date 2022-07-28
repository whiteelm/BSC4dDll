    subroutine bsc4d(aw1, aw2, h1, h2, t, e1, e2, dL, dC, Um, em, dZ0)
    !dec$ attributes stdcall, dllexport ::bsc4d
    !DEC$ ATTRIBUTES VALUE :: aw1, aw2, h1, h2, t, e1, e2
    !DEC$ ATTRIBUTES REFERENCE :: dL, dC, Um, dZ0, em
!   Тест подпрограммы bsc4d(iprint,aa,dL,dC)
!   BSCL (Broad-Side Coupled Line)- Связанные линии с лицевой связью 
    implicit real*8(a-b,d-h,o-v,x-y)
    dimension aa(8),dL(2, 2),dC(2, 2), Um(2, 2),dZ0(2, 2),em(2),dCC(2, 2),dLL(2, 2)
    aa(1) = 2    
    aa(2) = aw1  
    aa(3) = aw2  
    aa(4) = h1   
    aa(5) = h2   
    aa(6) = t    
    aa(7) = e1   
    aa(8) = e2   
    iprint = -2  
    call main(iprint,aa,dL,dC)
    n = 2
    dCC=dC
    dLL=dL
    call dminv(dLL,n,ad)
    call nroot(n,dCC,11.127*dLL,em,Um)
    call impedance(n,dC,Um,em,dZ0)
    dC=transpose(dC)
    dL=transpose(dL)
    dZ0=transpose(dZ0)
    Um=transpose(Um)
    end