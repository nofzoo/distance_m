CREATE OR REPLACE FUNCTION SOONI.distance_m
/* -----------------------------------------------------------------------
 *  緯度、経度による距離計算
 *
 * -----------------------------------------------------------------------
 */
(
  latitude1  IN number  -- 地点A 緯度
 ,longitude1 IN number  -- 地点A 経度
 ,latitude2  IN number  -- 地点B 緯度
 ,longitude2 IN number  -- 地点B 経度
)
RETURN number
IS
    dist   number(20,8);
    RADIUS CONSTANT NUMBER  := 6371;   -- 地球の半径
    PI     CONSTANT NUMBER  := 3.1415926535897932384626433832795028841971;
BEGIN
if(latitude1=latitude2 and longitude1=longitude2 ) then 
return 0;
end if;
dist := RADIUS * ACOS( 
        COS( latitude1 * PI /180 ) * COS( latitude2 * PI /180 )
        * COS( (longitude2 * PI /180 ) - (longitude1 * PI /180 ) )
        + SIN(latitude1 * PI /180 ) * SIN(latitude2 * PI /180)
        )
;
return dist*1000;
END;
/
