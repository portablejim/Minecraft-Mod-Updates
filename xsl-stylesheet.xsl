<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xlt="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" encoding="utf-8" indent="yes"/>
    <xsl:template match="/list">
        <html>
        <head lang="en">
            <meta charset="UTF-8"/>
            <title>Mod updating progress to <xsl:value-of select="@version"/></title>
            <link rel="stylesheet" href="style.css"/>
        </head>
        <body>
        <div class="inset">
        <div>
        <h1>Mod updating progress to <xsl:value-of select="@version"/><xlt:text> </xlt:text> <a href="https://github.com/portablejim/Minecraft-Mod-Updates/tree/gh-pages">[Github Repo]</a></h1>

        <h2>Key</h2>
        <table>
            <tbody>
                <tr class="updated">
                    <td>Updated</td>
                    <td>The mod has been updated to MC 1.8.</td>
                </tr>
                <tr class="inprogress">
                    <td>In-Progress</td>
                    <td>The mod author has announced she/he is currently working on the MC 1.8 update.</td>
                </tr>
                <tr class="pending">
                    <td>Pending</td>
                    <td>The mod author has not released any information on updating to MC 1.8.</td>
                </tr>
                <tr class="unstarted">
                    <td>Unstarted</td>
                    <td>The mod author is not updating to MC 1.8 for a while, and will stay in MC 1.7/1.6 until then. Many of these
                        are due to addons/required mods.
                    </td>
                </tr>
                <tr class="notupdating">
                    <td>Not Updating</td>
                    <td>The mod author is not updating to MC 1.8, ever.</td>
                </tr>
                <tr class="discontinued">
                    <td>Discontinued</td>
                    <td>The mod author will not plan on updating again. Sorry. :(</td>
                </tr>
            </tbody>
        </table>
        <h2>Mods</h2>
            <xsl:apply-templates/>
        </div>
        </div>
        </body>
        </html>
    </xsl:template>
    <xsl:template match="/list/category">
        <h3><xsl:value-of select="@name"/></h3>
        <table>
            <thead>
                <tr>
                    <th>Mod</th>
                    <th>Progress</th>
                    <th>Notes</th>
                </tr>
            </thead>
            <tbody>
                <xsl:apply-templates/>
            </tbody>
        </table>
    </xsl:template>
    <xsl:template match="/list/category/mod[@state='updated']">
        <tr class="updated">
            <td><xsl:value-of select="@name"/></td>
            <td>Updated</td>
            <td><xsl:value-of select="@note"/></td>
        </tr>
    </xsl:template>
    <xsl:template match="/list/category/mod[@state='inprogress']">
        <tr class="inprogress">
            <td><xsl:value-of select="@name"/></td>
            <td>In-Progress</td>
            <td><xsl:value-of select="@note"/></td>
        </tr>
    </xsl:template>
    <xsl:template match="/list/category/mod[@state='pending']">
        <tr class="pending">
            <td><xsl:value-of select="@name"/></td>
            <td>Pending</td>
            <td><xsl:value-of select="@note"/></td>
        </tr>
    </xsl:template>
    <xsl:template match="/list/category/mod[@state='unstarted']">
        <tr class="unstarted">
            <td><xsl:value-of select="@name"/></td>
            <td>Unstarted</td>
            <td><xsl:value-of select="@note"/></td>
        </tr>
    </xsl:template>
    <xsl:template match="/list/category/mod[@state='notupdating']">
        <tr class="notupdating">
            <td><xsl:value-of select="@name"/></td>
            <td>Pending</td>
            <td><xsl:value-of select="@note"/></td>
        </tr>
    </xsl:template>
    <xsl:template match="/list/category/mod[@state='discontinued']">
        <tr class="discontinued">
            <td><xsl:value-of select="@name"/></td>
            <td>Discontinued</td>
            <td><xsl:value-of select="@note"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>