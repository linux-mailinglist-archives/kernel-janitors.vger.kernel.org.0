Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AC8D72C3D8
	for <lists+kernel-janitors@lfdr.de>; Mon, 12 Jun 2023 14:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231896AbjFLMTJ (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Mon, 12 Jun 2023 08:19:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231318AbjFLMTI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 12 Jun 2023 08:19:08 -0400
X-Greylist: delayed 2743 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 12 Jun 2023 05:19:04 PDT
Received: from mail0.ceniai.inf.cu (mail0.ceniai.inf.cu [169.158.128.148])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 085318F
        for <kernel-janitors@vger.kernel.org>; Mon, 12 Jun 2023 05:19:03 -0700 (PDT)
Received: from mail0.ceniai.inf.cu (localhost [127.0.0.1])
        by mail0.ceniai.inf.cu (Postfix) with ESMTP id 4D2086C867B;
        Mon, 12 Jun 2023 07:04:48 -0400 (EDT)
X-Virus-Scanned: amavisd-new at mail0.ceniai.inf.cu
Received: from mail0.ceniai.inf.cu ([127.0.0.1])
        by mail0.ceniai.inf.cu (mail0.ceniai.inf.cu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 6Clfth-zQIwX; Mon, 12 Jun 2023 07:04:48 -0400 (EDT)
Received: from mail.vega.inf.cu (ns.vega.inf.cu [169.158.143.34])
        by mail0.ceniai.inf.cu (Postfix) with ESMTP id 121036C807B;
        Mon, 12 Jun 2023 06:32:54 -0400 (EDT)
Received: from mx1.ecovida.cu (unknown [169.158.179.26])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail.vega.inf.cu (Postfix) with ESMTPS id 457C3388BCB;
        Sun, 11 Jun 2023 01:47:36 -0400 (CDT)
Received: from mx1.ecovida.cu (localhost [127.0.0.1])
        by mx1.ecovida.cu (Proxmox) with ESMTP id DCCA7240BC0;
        Sun, 11 Jun 2023 05:31:16 -0400 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ecovida.cu; h=cc
        :content-description:content-transfer-encoding:content-type
        :content-type:date:from:from:message-id:mime-version:reply-to
        :reply-to:subject:subject:to:to; s=ecovida20; bh=eJCLj5LjLfltOUH
        QwbhnEIM71NnOqC+k0uTJlyqNYA0=; b=NBtoYbk/8Coex9QamHmOVGhC4qqoWcR
        Rbrgmhhl4aG366h6fKCsHJ77u/n0f+mwJBaVNwe7BP8DV62oXFhZNcl7p0H8PXBQ
        mqzFWX4DLHTRiRyTpipUwTC6APNLP1q0lf570FjK03joVDJfSNgRJdJtCwqe26kO
        FxqTJUtChWTYzpJZNPokscuU7PC1MU6l29qiXEsc5xRTp75zgF8Qx5JWT3CZhHcx
        dGd5pYd4pkdfHgy3w8QySkIrlqGKNUED2b6ttmQ8VJhtP6H0fioBUmAcWxFJ7/Fv
        0taBLKNsn/gZWEmd0Dt2Rn1mHv2OjdoCG12XB2XBlRYwEP+8O2UyISQ==
Received: from correoweb.ecovida.cu (correoweb.ecovida.cu [192.168.100.7])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mx1.ecovida.cu (Proxmox) with ESMTPS id CD85B240561;
        Sun, 11 Jun 2023 05:31:16 -0400 (CDT)
Received: from localhost (localhost [127.0.0.1])
        by correoweb.ecovida.cu (Postfix) with ESMTP id 527C84A2CB5;
        Sun, 11 Jun 2023 05:31:16 -0400 (CDT)
Received: from correoweb.ecovida.cu ([127.0.0.1])
        by localhost (correoweb.ecovida.cu [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id NtzTrS-0MBNj; Sun, 11 Jun 2023 05:31:16 -0400 (CDT)
Received: from localhost (localhost [127.0.0.1])
        by correoweb.ecovida.cu (Postfix) with ESMTP id 53BAC4A2774;
        Sun, 11 Jun 2023 05:28:52 -0400 (CDT)
X-Virus-Scanned: amavisd-new at ecovida.cu
Received: from correoweb.ecovida.cu ([127.0.0.1])
        by localhost (correoweb.ecovida.cu [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id OORIskxkTyBe; Sun, 11 Jun 2023 05:28:52 -0400 (CDT)
Received: from [192.168.100.9] (unknown [45.88.97.218])
        by correoweb.ecovida.cu (Postfix) with ESMTPSA id CEC334A3183;
        Sun, 11 Jun 2023 05:25:52 -0400 (CDT)
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: RE:
To:     Recipients <lazaroluis@ecovida.cu>
From:   Aldi Albrecht <lazaroluis@ecovida.cu>
Date:   Sun, 11 Jun 2023 10:29:59 +0100
Reply-To: aldiheister@gmail.com
X-Antivirus: Avast (VPS 230611-2, 6/11/2023), Outbound message
X-Antivirus-Status: Clean
Message-Id: <20230611092552.CEC334A3183@correoweb.ecovida.cu>
X-Spam-Status: Yes, score=6.1 required=5.0 tests=BAYES_50,DKIM_INVALID,
        DKIM_SIGNED,FREEMAIL_FORGED_REPLYTO,NIXSPAM_IXHASH,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  3.0 NIXSPAM_IXHASH http://www.nixspam.org/
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.1 DKIM_INVALID DKIM or DK signature exists, but is not valid
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hallo gesch=E4tzter Beg=FCnstigter, Sie wurden f=FCr eine gro=DFe Geldsumme=
 f=FCr humanit=E4re und Investitionszwecke jeglicher Art ausgew=E4hlt. F=FC=
r weitere Details antworten Sie bitte.

Gr=FC=DFe
 
Beate Heister
Eigent=FCmer
Aldi Albrecht-TRUST

-- 
This email has been checked for viruses by Avast antivirus software.
www.avast.com

