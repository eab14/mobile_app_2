import React, { useState } from 'react';
import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, TextInput, Button } from 'react-native';

export default function App() {

	const [email, setEmail] = useState('');
	const [password, setPassword] = useState('');

	const handleLogin = () => {

		fetch('http://localhost:8000/api/login', { method: 'POST', headers: { "Access-Control-Allow-Origin": "*", 'Content-Type': 'application/json' }, body: JSON.stringify({ email, password }) })

			.then(response => {

				if (response.ok) console.log('Login successful');
				else console.error('Login failed');

			})
			.catch(error => console.error('Error:', error));
	};

	return (
		<View style={styles.container}>
		<Text>Email:</Text>
		<TextInput
			style={styles.input}
			onChangeText={text => setEmail(text)}
			value={email}
			placeholder="Enter your email"
		/>
		<Text>Password:</Text>
		<TextInput
			style={styles.input}
			onChangeText={text => setPassword(text)}
			value={password}
			placeholder="Enter your password"
			secureTextEntry={true}
		/>
		<Button title="Login" onPress={handleLogin} />
		<StatusBar style="auto" />
		</View>
	);
}

const styles = StyleSheet.create({

	container: {
		flex: 1,
		backgroundColor: '#fff',
		alignItems: 'center',
		justifyContent: 'center',
		paddingHorizontal: 20,
	},
	input: {
		width: '100%',
		height: 40,
		borderColor: 'gray',
		borderWidth: 1,
		marginBottom: 20,
		paddingHorizontal: 10,
	}

});