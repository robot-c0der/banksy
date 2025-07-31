export function setupSwitcher() {
    /*!
    * Color mode toggler from/for Bootstrap's docs (https://getbootstrap.com/)
    * Copyright 2011-2023 The Bootstrap Authors
    * Licensed under the Creative Commons Attribution 3.0 Unported License.
    */
   
    const getStoredTheme = () => localStorage.getItem('theme')
    const setStoredTheme = theme => localStorage.setItem('theme', theme)
    
    const getPreferredTheme = () => {
        const storedTheme = getStoredTheme()
        if (storedTheme) {
            return storedTheme
        }
        
        return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
    }
    
    const setTheme = theme => {
        if (theme === 'auto' && window.matchMedia('(prefers-color-scheme: dark)').matches) {
            document.documentElement.setAttribute('data-bs-theme', 'dark')
        } else {
            document.documentElement.setAttribute('data-bs-theme', theme)
        }
    }
    
    setTheme(getPreferredTheme())
    
    const showActiveTheme = (theme, focus = false) =>
    {
        const options = document.querySelectorAll('#theme_selector>option')
        
        if (!options)
            return

        options.forEach((el) =>
        {
            if (el.value == theme)
                el.setAttribute('selected', '');
        });
    }
    
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', () => {
        const storedTheme = getStoredTheme()
        if (storedTheme !== 'light' && storedTheme !== 'dark') {
            setTheme(getPreferredTheme())
        }
    })
    
    window.addEventListener('DOMContentLoaded', () => {
        // showActiveTheme(getPreferredTheme())
        if (document.getElementById('theme_selector'))
        {
            // try to make the theme selector show the correct setting
            showActiveTheme(getStoredTheme());

            document.getElementById('theme_selector').addEventListener('change', (e) => 
            {
                const chosenTheme = e.target.value.toLowerCase();
                const validThemes = ['light', 'dark', 'auto'];

                if (validThemes.indexOf(chosenTheme) != -1)
                {
                    setStoredTheme(chosenTheme);
                    setTheme(chosenTheme);
                }

            });
        }
        
        window.switcherSetup = true;
    })
}