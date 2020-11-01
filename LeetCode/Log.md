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
## Day-3
### [Distribute Candies](https://leetcode.com/problems/distribute-candies/)

```java
class Solution 
{
    public int distributeCandies(int[] candies) 
    {
        HashMap<Integer,Integer>types=new HashMap<Integer,Integer>();
        for(int i=0;i<candies.length;i++)
        {
            if(!types.containsKey(candies[i]))
            {
                types.put(candies[i],1);
            }
            else
                types.put(candies[i],types.get(candies[i])+1);
        }
        if(types.size()>=candies.length/2)
            return candies.length/2;
        else
            return types.size();
    }
}
```
### [Sum Of Left Leaves](https://leetcode.com/problems/sum-of-left-leaves/)

```java
class Solution
{
    public boolean isleaf(TreeNode root)
    {
        if(root==null)
            return false;
        if(root.left==null && root.right==null)
            return true;
        return false;
    }
    public int sumOfLeftLeaves(TreeNode root) 
    {
        if(root==null)
            return 0;
        if(isleaf(root.left))
        {
            return root.left.val+sumOfLeftLeaves(root.right);
        }
        return sumOfLeftLeaves(root.right)+sumOfLeftLeaves(root.left);
    }
}
```

## Day-4
###[Count Characters](https://leetcode.com/problems/find-words-that-can-be-formed-by-characters/)
```java
class Solution 
{
    public int countCharacters(String[] words, String chars) 
    {
        HashMap<Character,Integer>hash=new HashMap<Character,Integer>();
        for(int i=0;i<chars.length();i++)
        {
            if(hash.containsKey(chars.charAt(i)))
            {
                hash.put(chars.charAt(i),hash.get(chars.charAt(i))+1);
            }
            else
                hash.put(chars.charAt(i),1);
        }
        int ans=0;
        for(int i=0;i<words.length;i++)
        {
            HashMap<Character,Integer>temp=new HashMap<Character,Integer>();
            boolean all=true;
            for(int j=0;j<words[i].length();j++)
            {
                if(!hash.containsKey(words[i].charAt(j)))
                {all=false;break;}
                if(temp.containsKey(words[i].charAt(j)))
                {
                    temp.put(words[i].charAt(j),temp.get(words[i].charAt(j))+1);
                }
                else
                    temp.put(words[i].charAt(j),1);
            }
            if(all)
            {
                boolean chk=true;
                for(int j=0;j<words[i].length();j++)
                {
                    if(temp.get(words[i].charAt(j))>hash.get(words[i].charAt(j)))
                    {chk=false;break;}
                }
                if(chk)
                    ans=ans+words[i].length();
            }
        }
        return ans;
    }
}
``` 
###[Maximum Level Sum of a Binary Tree](https://leetcode.com/problems/maximum-level-sum-of-a-binary-tree/)
```java
class Solution 
{
    HashMap<Integer,List<Integer>>hash=new HashMap<Integer,List<Integer>>();
    public void lTrav(TreeNode root,int level)
    {
        if(root==null)
            return;
        if(!hash.containsKey(level))
        {
            List<Integer>lisa=new ArrayList<Integer>();
            lisa.add(root.val);
            hash.put(level,lisa);
        }
        else
        {
            List<Integer>lisa=hash.get(level);
            lisa.add(root.val);
            hash.put(level,lisa);
        }
        lTrav(root.left,level+1);
        lTrav(root.right,level+1);
    }
    public int maxLevelSum(TreeNode root) 
    {
        lTrav(root,0);
        int max=Integer.MIN_VALUE;
        int lev=0;
        System.out.println(hash);
        for(Integer vals : hash.keySet())  
        { 
            // search  for value 
            List<Integer> lisa = hash.get(vals); 
            int sum=0;
            for(int i=0;i<lisa.size();i++)
            {
                sum=sum+lisa.get(i);
            }
            if(sum>max)
            {max=sum;lev=vals;}
        } 
        return lev+1;
    }
}
```


