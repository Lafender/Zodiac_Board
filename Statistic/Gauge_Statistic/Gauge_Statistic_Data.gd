extends Resource
class_name Gauge_Statistic_Data

## Maximum available gauge points available for consumption. Can be refilled up to this point.
export(int) var pool_limit= 10
export(int) var pool_current = pool_limit