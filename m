Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B13221DC03F
	for <lists+kernel-janitors@lfdr.de>; Wed, 20 May 2020 22:34:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728026AbgETUeX (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 20 May 2020 16:34:23 -0400
Received: from sonic316-21.consmr.mail.ne1.yahoo.com ([66.163.187.147]:46331
        "EHLO sonic316-21.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726860AbgETUeW (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 20 May 2020 16:34:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1590006861; bh=6mffK3RH01pMSJbI3gzRyn/TJ4jPuu2pqeTpPbg3ras=; h=Date:From:Reply-To:Subject:References:From:Subject; b=VcmrdYDlDoKJzzlaLyihIx/N6KPmseaTGQNwt2z0fc2t4FwriYQrQw3AIeSPcfbw0dYrVY0hxECY3CORpuYaM+FR4bS3TMY8+A2S8PMStXVp+96sc4tljlntKwKsiIxClO5qlo4GJabwJCo17OGgRPK899EG/g4uzQw7BuGgOsE1KhpfTs8MAaIZKMV6yn6lcCcCs4vhTNPFd27ZUVw0+Aw+I8Ei4c3pR8NNFtRwtBquBdrDyN83+w78GlgrtqZ/NPCI2T4jdwa2M4BnssAgubyLwPzuno4XxzBmcK0FqXGa7/i+3sjNF8nhtn+dFlnL7ulQAxsn610zJZk9EhgB4g==
X-YMail-OSG: OUZpFDAVM1lQzMamLjhA4IBUeVMA4W7LQ3IV_KEh1tE69K5Gb.51jOjpX4Dr62U
 PYLr4oa5WShFk6C0azdIFkSA6MeqXqHvx844YL5FebcqvJ1r.Fg2znVWiXAVkh7vQ3hOrq58rYid
 rjBTP78KW_mM_JHp6ksQD0MeiQ1vPFlVEvTFq8.WVaAkQkBJHsac7um9gPD5JvNrMesD_cOZrHqp
 m_BHJAnBC70xQPQFfTlBJ4Yj6KpmApMdNok3_.NPPujHlhQaaPHz5PHkNphnn8umhw8rlu3j5C2Y
 OW9JSbNMn.Vuaoo52U2WcoCjrPKYN59iUoxIlCVttxE1JJAxJIwJuCJca0Hxn65yRO1T9ad17Yih
 dQBT9_EcNBrS0rP5MRAbwBqA93TSApCUh56F7WqkQjBYUdEQwMq1HP74FWeDbhoOvp1uNllSunQ.
 Osb5rCWKCfLdUrAy0UhZMcEvxGE95EXxcBPq8JtVpmv3KfA3WAgfqNevjSUH5WJ6h4Gp6IUIEpIk
 KylwYxlYDPghbHs6raw3WKcdOFvwXb.kWueqvgNk_O1SO.avGz1lHMEFZrioMDc2Yku7p_9_mfHp
 DDiui8olT7ba1s5xg7KlchCR0UgkuJEGKqP4XZOLRPkwrR_90JGqxBRb4UCinp1Px4urBmz2MAgE
 X3MJBvZzpYTEfP1lyTGADKpyFGJsPkyoGB1wlytiqKaPSkxWq44V1bUKcJj2kXBfoqYcy8SIXJTa
 sVDr11tT147xyYPbMlVYOccuCj9nQgyc_Knu11YvoynzLTwtWEFmmvKS4LUhjgThptvuCrNSeqzE
 Smrdys34zwztHcora5P0ATX899PLfHovVxJ5GJQ4uxv8VUxV1RjOoTv7jp6aBLpr6sYvTiFh5hon
 U59BY.db9IrYjvXHg1Kj64DhVavprx7ZL71nc50o8X.vkFe8yME_4bMOVOy0o_bN3G89IEFr1kEG
 GKeE0Lyx8xtI6ax5c282LgV6TUIP_RxcCqpPY9wSfaZQL2iBzjirZGCJSmHUU84uYhN0CS5b5sSh
 wQkN0VE_1dJAH.eB7CyiXEwOC1AlRLHO8quU9YNBAiJBvzckz8xlON8FoUhfkFMkM9MakkcEC7ID
 hlBQ0MLobyD2g.n4TZBWvywVCk4gXjDq6RYZ0zTe3o1WnImYelie3q35NSGNoEYiPoGsa2_VYW3b
 TcSXaCf33PFqevtnUdimuKH23tgUAcijTeQcxcxLdA64lXsAnohHeTHuMLYduOPdPhnAHfLQZddl
 _PlsreUt5p9mD9V2jCeKgvrfQ5ypiUkKNYZ4V6f9hcHB8W8kJUcnyGblimHI78ug7LrCIOYWC6vE
 -
Received: from sonic.gate.mail.ne1.yahoo.com by sonic316.consmr.mail.ne1.yahoo.com with HTTP; Wed, 20 May 2020 20:34:21 +0000
Date:   Wed, 20 May 2020 20:34:20 +0000 (UTC)
From:   Rose Gordon <rosegordonor@gmail.com>
Reply-To: rosegordonor@gmail.com
Message-ID: <1338144992.81462.1590006860905@mail.yahoo.com>
Subject: Hi there
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <1338144992.81462.1590006860905.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15959 YMailNodin Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:72.0) Gecko/20100101 Firefox/72.0
To:     unlisted-recipients:; (no To-header on input)
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi Best of the day to you I'm Rose by name 32years old single lady, Can we be friends? i was born and raised in london in United Kingdom Take care Rose.
