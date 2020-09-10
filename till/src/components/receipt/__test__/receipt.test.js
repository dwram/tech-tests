import React from "react";
import ReactDOM from 'react-dom';
import Receipt from "../receipt";
import { render, cleanup } from '@testing-library/react'

afterEach(cleanup)
test("renders without crashing", () => {
    const div = document.createElement('div')
    ReactDOM.render(<Receipt/>, div)
});

test('renders receipt correctly', () => {
    const { getByTestId } = render(<Receipt/>)
    expect(getByTestId('receipt')).toHaveTextContent("Current receipt")
});

test('adds  to receipt', () => {
    const { getByTestId } = render(<Receipt />)
});
