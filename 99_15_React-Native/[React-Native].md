## flatlist inside scrollview
VirtualizedLists should never be nested inside plain ScrollViews with the same orientation because it can break windowing and other functionality - use another VirtualizedList-backed container instead. 

### before
```js

<ScrollView >
    <FlatList />
</ScrollView>

```

### after
```js
<ScrollView horizontal={false} style={{width: '100%', height: '100%'}}>
    <ScrollView horizontal={true} style={{width: '100%', height: '100%'}}>
        <FlatList />
    </ScrollView>
</ScrollView>
```

