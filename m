Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26F1462165E
	for <lists+kernel-janitors@lfdr.de>; Tue,  8 Nov 2022 15:27:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234070AbiKHO1K (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Tue, 8 Nov 2022 09:27:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233742AbiKHO0Z (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 8 Nov 2022 09:26:25 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CEC521AC
        for <kernel-janitors@vger.kernel.org>; Tue,  8 Nov 2022 06:25:13 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id b11so13947862pjp.2
        for <kernel-janitors@vger.kernel.org>; Tue, 08 Nov 2022 06:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=qJPWO9SMfKs9CV4DzOtfpg0tG5L2kEZQtV/LBBChMrnKplvig/HcfOA36QzOFbaour
         tgINSm9CFH0IH0weUkbi8oL7C5P0uFU99A+FANpQrOPV/x2at1b6HjUUAphEgu/Nt2rO
         YdZzEeguInvIt6hR0YTDbuGc0g6QmBH3JOdUVEiMakuZ8pUv0rSqDGDPPz36WP9L+M70
         Yi8Qvn61/fVJa/s6+O6bNGj9Vrx81J7VmEWQcrrTipgg1zMWjvYHOXsRX3Tp8F7t1isZ
         URWNY0E6DDGhkUjSdRf6tRRt6Dm01iRomcQNGIBkoA7vu4q8ZFmcmXCe9DgPR3TaW/OT
         odpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzBlYeGeT15Xra75w9IZDBjQ7Da3XKSmRdlnDJDYrko=;
        b=QoAr75D0jmcLK3YHaZJTDMbUCRkRG3qnYIm2P89FWrTlGoLqOKh2moSklFGBJgdfGL
         cROCTs1P2f+D3jhOiE2cYd2EqT2dyycJEfWw/RomO2Lu8K26PWix0pI4LzIbdY1a2lly
         pOGnIzg8mzQiwm87GNZ+T+XhRDecRDVKbGIGRPtGx7l+lYzEqnKh/s7xjgD5J1C58MbY
         qegEBsF8UR160QVq0j7mTVbWzFNYZ+wMANqvgJc5gf5GmJzYFBFY1T5EYydKdFng2HK6
         7STlVAI/1Ab/MUQEjVxiDq1qxH0A8GNboqSIl9Ua7TVDeD2xrQUXkXFul6XQOyPTx8Y8
         MuRQ==
X-Gm-Message-State: ACrzQf1TOZM24n3YrTx+fn0SJifnvCP6xu9W00QOOEsy1cf/4Aspt63C
        53I3zlSubMpI+WC5Rdr6kRq0JB3mKoULvGXicpk=
X-Google-Smtp-Source: AMsMyM7xjnW3BCIcPmRXceI8CMPrgJsNpwknP0oXmxg9pb3hPM8UnVyASTbWsNqLc31U8nSLRepoWwOH4L/DHUye4LA=
X-Received: by 2002:a17:90b:1d90:b0:213:c798:86f6 with SMTP id
 pf16-20020a17090b1d9000b00213c79886f6mr52558648pjb.84.1667917512394; Tue, 08
 Nov 2022 06:25:12 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7300:5388:b0:85:81c6:896c with HTTP; Tue, 8 Nov 2022
 06:25:11 -0800 (PST)
Reply-To: mr.abraham022@gmail.com
From:   "Mr.Abraham" <davidkekeli11@gmail.com>
Date:   Tue, 8 Nov 2022 14:25:11 +0000
Message-ID: <CAPBO+FJ3Nhd2ncX9Z_fDUqYStiGQU821nC6EEFSDx5iCTdXkaQ@mail.gmail.com>
Subject: Greeting
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.0 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:102c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4997]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mr.abraham022[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [davidkekeli11[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [davidkekeli11[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

My Greeting, Did you receive the letter i sent to you. Please answer me.
Regard, Mr.Abraham
