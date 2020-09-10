import React from "react";
import ReactDOM from 'react-dom';
import '../../../App'
import Menu from "../menu.js"
import { render, cleanup } from '@testing-library/react'

afterEach(cleanup)

test('does not crash loading menu', () => {
    const { getByTestId } = render(<Menu/>)
    expect(getByTestId('menu')).toHaveTextContent('Items')
});