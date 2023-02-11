import React from 'react';
import {SafeAreaView, Text, StyleSheet, Linking} from 'react-native';

function openLink() {
  Linking.openURL('https://github.com/retyui');
}

function App() {
  return (
    <SafeAreaView style={styles.root}>
      <Text style={styles.title}>
        👨‍💻👋 Ultimate CI/CD guide by{' '}
        <Text onPress={openLink} style={styles.link}>
          retyui
        </Text>
      </Text>
    </SafeAreaView>
  );
}

const styles = StyleSheet.create({
  root: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingHorizontal: 16,
  },
  link: {
    color: 'blue',
    textDecorationLine: 'underline',
  },
  title: {
    fontSize: 24,
    color: 'black',
  },
});

export default App;
