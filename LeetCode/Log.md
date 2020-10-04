## Day1-Problem 1
### Problem From LC Contest
#### [Design A Parking Lot](https://leetcode.com/contest/biweekly-contest-36/problems/design-parking-system/)
#### Code

```java
class ParkingSystem 
{
    int b=0;
    int m=0;
    int s=0;
    public ParkingSystem(int big, int medium, int small) 
    {
        b=big;
        m=medium;
        s=small;
    }
    
    public boolean addCar(int carType) 
    {
        if(carType==1 && b>0)
        {b=b-1;return true;}
        else if(carType==2 && m>0)
        {m=m-1;return true;}
        else if(carType==3 && s>0)
        {s=s-1;return true;}
        else
        return false;
    }
}
```
---

## Day1=Problem2
### Problem From LC Daily
#### [K Pairs In Array](https://leetcode.com/problems/k-diff-pairs-in-an-array/)
#### Code
```java
class Solution 
{
    public int findPairs(int[] nums, int k) 
    {
        int nope=Integer.MIN_VALUE;
        HashMap<Integer,Integer>hash=new HashMap<Integer,Integer>();
        for(int i=0;i<nums.length;i++)
        {
            if(!hash.containsKey(nums[i]))
                hash.put(nums[i],1);
            else
                hash.put(nums[i],hash.get(nums[i])+1);
        }
        int c=0;
        for(int i:hash.keySet())
        {
            if(k>0 && hash.containsKey(i+k) || k==0 && hash.get(i)>1)
                c++;
        }
        return c;
    }
}
```
---

## Day2
### [Remove Covered Intervals](https://leetcode.com/explore/challenge/card/october-leetcoding-challenge/559/week-1-october-1st-october-7th/3483/)

```java
class Solution 
{
    public int removeCoveredIntervals(int[][] intervals) 
    {
        int count=0;
        if(intervals.length<=1)
            return intervals.length;
        for(int i=0;i<intervals.length;i++)
        {
            int start=intervals[i][0];
            int end=intervals[i][1];
            for(int j=0;j<intervals.length;j++)
            {
                if(i!=j)
                {
                if(intervals[j][0]<=start && end<=intervals[j][1])
                {count++;break;}   
                }
            }
        }
        return intervals.length-count;
    }
}
```