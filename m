Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84EBF6EFBCE
	for <lists+kernel-janitors@lfdr.de>; Wed, 26 Apr 2023 22:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239830AbjDZUku (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Wed, 26 Apr 2023 16:40:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239443AbjDZUks (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Apr 2023 16:40:48 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4977510DE
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Apr 2023 13:40:47 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-3ef69281e68so23955931cf.1
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Apr 2023 13:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682541646; x=1685133646;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JL3yT3Q33W5/BCQtgOVvz2cK4S2v0dqNTi6RS5aes9g=;
        b=gzUhb84GEy0gACepsIceB4ZFm15ZccVw9XxAPAvv7m58nHuDgWZkz0Jk1VIitZjmSe
         Iq85JvC6A7BhDLeiF1/+ILgAeJyRYh5KswdTEGjXleFDtE81p7Mh/yp0Ya4EsDi5Tug6
         ZCq4s7feg5bZFJsMKqZ7HBZAcuG0/ZSW1MXl8W1rCw7SXDPrb3zfXbrFoWFCW+TS7pdE
         id3lmGDuHRqVRxU2++kuQNRgOWXiB70FB8O4oyg4i7NrgAD6aKf2raxzLrBWx/9C/VM7
         Z66eiS0gWuK/+ktqIyqMWNpjg4JlU8Nq+odw4oeEQz/jQiU6Jjim8C14c+PCC8T83xoW
         LwUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682541646; x=1685133646;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JL3yT3Q33W5/BCQtgOVvz2cK4S2v0dqNTi6RS5aes9g=;
        b=gbsvK9IEg4GPmiDUGMSakIbShQ8FOofw99CWiEyKEtY43tUA4iOqr/CXrAkVNBWEIW
         nys3TBO1sP7t/TySPYeZ1xGY/K7/4Kxj7V+TMKAPAs9Dj1Nzhr1ymy8R53fTFys9kINS
         vz3aiG+zYawSgyt8EaTIxibTgQmjNVFf5hTN6FG9dNfyZ8LD7Ksp3wyb4nveUpjzdxVh
         g5pRpscP2Nb6tCtZju+x23ittGJa3hAmHv74Kyct0hXTUk+M+hIo8kXpqujNNddhOjoS
         PEeyvyXHpmv5d8+xyFFTBTeig4SHqdi5Isp7luNKNuymCs4KmBBLCKXWGdue8YbArjCY
         OvtA==
X-Gm-Message-State: AAQBX9dESJv2M7c9sS5cyENyaKr0Gb1dc5GICrqsP8oGIz5N6bpySJ1s
        4QC7wwVstkDjZO2RYzgfHBahN6/JirMw+Bj7CkJbNIreij/Z4VMo2+o=
X-Google-Smtp-Source: AKy350Z+LUynoSgOOXoSuCL1UYJIhj6c1kRi8lzcDDWKucoNZL/FrdHjsgUyTS6+H2zCaPRaCrEtz/3WOpKaZt88CBw=
X-Received: by 2002:a05:622a:345:b0:3e3:8ed5:a470 with SMTP id
 r5-20020a05622a034500b003e38ed5a470mr35537898qtw.1.1682541646326; Wed, 26 Apr
 2023 13:40:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:622a:1391:b0:3b8:6d45:da15 with HTTP; Wed, 26 Apr 2023
 13:40:45 -0700 (PDT)
Reply-To: klassoumark@gmail.com
From:   Mark Klassou <georgerown101@gmail.com>
Date:   Wed, 26 Apr 2023 20:40:45 +0000
Message-ID: <CAHmBb7shSYieV_4jXDtgeZEF5osjcygCFUTm-Bz6TBNeRDyqHA@mail.gmail.com>
Subject: Re
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.9 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Good Morning,

I was only wondering if you got my previous email? I have been trying
to reach you by email. Kindly get back to me swiftly, it is very
important.

Yours faithfully
Mark Klassou.
