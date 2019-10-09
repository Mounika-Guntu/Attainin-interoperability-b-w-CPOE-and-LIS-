<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"    
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">       
    <xsl:output method="text"/>      
    <xsl:template match="/">   
    <xsl:for-each select="/ClinicalDocument/recordTarget[1]/patientRole[1]/patient[1]">
        patient:
        names: [{
        "givenName": "<xsl:value-of select="/ClinicalDocument/recordTarget[1]/patientRole[1]/patient[1]/name[1]/given[1]"/>",
        "familyName": "<xsl:value-of select="/ClinicalDocument/recordTarget[1]/patientRole[1]/patient[1]/name[1]/family[1]"/>"
        }]
        "gender": "<xsl:value-of select="/ClinicalDocument/recordTarget[1]/patientRole[1]/patient[1]/administrativeGenderCode[1]/@code"/>",
        "birthdate":"2000-01-18T12:45:32.000-0400"
        }]
    </xsl:for-each>
        <xsl:for-each select="/ClinicalDocument/recordTarget/patientRole/addr">
            personaddress:
            {
            "address1":" <xsl:value-of select="streetAddressLine"/>",
            "cityVillage": "<xsl:value-of select="city"/>",
            "stateProvince": "<xsl:value-of select="state"/>",
            "postalCode": "<xsl:value-of select="postalCode"/>",
            "country":"<xsl:value-of select="country"/>"
            }
        </xsl:for-each>
        Assigned person:
        <xsl:for-each select="/ClinicalDocument/author[1]/assignedAuthor[1]/assignedPerson[1]">
          { "gender":"M",
            "names": [{
            "suffix":"<xsl:value-of select="name/suffix"/>",
            "givenName": "<xsl:value-of select="name/given"/>",
            "familyName": "<xsl:value-of select="name/family"/>"
            }]
            }
        </xsl:for-each>
        <xsl:for-each select="/ClinicalDocument/component[1]/structuredBody[1]/component[13]"> 
            { "orderReason": "<xsl:value-of select="/ClinicalDocument/component[1]/structuredBody[1]/component[13]/section[1]/text[1]/paragraph[1]"/>",
        </xsl:for-each>
        <xsl:for-each select="/ClinicalDocument/component[1]/structuredBody[1]/component[6]">
            "clinicalHistory":"<xsl:value-of select="section[1]/text[1]/paragraph[1]"/>",
            "clinicalHistory":"<xsl:value-of select="section[1]/text[1]/paragraph[2]"/>",
            "clinicalHistory":"<xsl:value-of select="section[1]/text[1]/paragraph[3]"/>",
            "clinicalHistory":"<xsl:value-of select="section[1]/text[1]/paragraph[4]"/>",
        </xsl:for-each>
        <xsl:for-each select="/ClinicalDocument/component[1]/structuredBody[1]/component[14]/section[1]/entry[1]/organizer[1]">
            "display":"<xsl:value-of select="component[1]/observation[1]/code[1]/@displayName"/>",
            "display":"<xsl:value-of select="component[2]/observation[1]/code[1]/@displayName"/>",
            "display":"<xsl:value-of select="component[3]/observation[1]/code[1]/@displayName"/>"
            }    
        </xsl:for-each>
    </xsl:template>
        
</xsl:stylesheet>
