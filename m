Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4563B65D303
	for <lists+kernel-janitors@lfdr.de>; Wed,  4 Jan 2023 13:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbjADMtp (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 4 Jan 2023 07:49:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbjADMto (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 4 Jan 2023 07:49:44 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E232D167FA
        for <kernel-janitors@vger.kernel.org>; Wed,  4 Jan 2023 04:49:43 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id b3so50263871lfv.2
        for <kernel-janitors@vger.kernel.org>; Wed, 04 Jan 2023 04:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g2m/uNsCm/OsAUZxAnJOSdXXDa9Gh4wg88n4VPL2lMU=;
        b=PpbUdbofVmBQQZZTp2RUm+CbaCmQdtyUzeVJiE+zR6LZbd09h1S9oit+7lCIpj+dpH
         jhXtmnKrl42+WkYxEVhs7BR8aBz6cY48JO5FseRLbnHSnWy8NgRk/fzsRQzb3vaNqTA7
         Xvar3iD5+rjWX7tW5Sp8GloNfrVt1fIpM4JFOw/PAMRhF2j6f4IiPq6iMkbjfooAwaFr
         CV0x4KK4lhYD6vSr9JAz54QgLX10F8b0bIZtpCEaNx3riD0ZiAhFytugq255QEBxc+/d
         dQ4c23NPooO4WT2AsHZYQQSObw9hYkmqSXoyt5sAthKj1gpqQGaRF6r2FeGDuDug5E8l
         AdSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2m/uNsCm/OsAUZxAnJOSdXXDa9Gh4wg88n4VPL2lMU=;
        b=3ZnEFhITgUpB/enQWbi1nnKzMcukZbwTcxI/0lLgUNe631HMOTP0OuOFm5WXZQqjm+
         kwKm2eGThRftqzFwP5QnJWxZOKxvUd9IVQOzPGFrTErUFV2tJm7fYFnWFQUdQLDNzdqb
         +BuhuxmneUbpLy4PO0850sgBp2sI0cmXrjP2OSiVrxIZCpWZprgGgArMp/ledcDgDChf
         p0n7WVcyfFahTVkTb3HZHRsleaNWKv/hyI/II8OUMKnoIjDUCPtcd/aulzPtgYKfn25I
         jJel/cQXMQWZ7OccWvSoxEpg/vLK729uC3gXQp6kxumuKZaZP2ZeVhueinLzdbMCuGxT
         Evgw==
X-Gm-Message-State: AFqh2kokpUVB+xMtcknCB9m1eY5c469l5o+4wLsR3n9hCRoRO9HQZleP
        x7K+jiPw6NNK7TrMEkqW07LxZdbKoQzN9j+i2HK1V/ztwjU=
X-Google-Smtp-Source: AMrXdXtZPhutZ2IIPTEZJ1H9aEU2iOidTGDIxTptzHabvnD16TXoM46QU1NxlOi+SoqRP1RsXy1tMps7RgKQYzTwAbs=
X-Received: by 2002:aa7:d489:0:b0:46c:5109:66fa with SMTP id
 b9-20020aa7d489000000b0046c510966famr5791792edr.309.1672836571446; Wed, 04
 Jan 2023 04:49:31 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:907:1b0c:b0:7c0:fa7f:6f2f with HTTP; Wed, 4 Jan 2023
 04:49:29 -0800 (PST)
Reply-To: Gregdenzell9@gmail.com
From:   Greg Denzell <ffgrdenzl41@gmail.com>
Date:   Wed, 4 Jan 2023 12:49:29 +0000
Message-ID: <CANJpBKD0hkPOwcqPHd1McW1j3mAXdvvcmruRwR4J7r2HY738fQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        HK_RANDOM_ENVFROM,HK_RANDOM_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:134 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5005]
        *  1.0 HK_RANDOM_FROM From username looks random
        *  0.0 HK_RANDOM_ENVFROM Envelope sender username looks random
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [ffgrdenzl41[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [gregdenzell9[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [ffgrdenzl41[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Seasons Greetings!

This will remind you again that I have not yet received your reply to
my last message to you.
