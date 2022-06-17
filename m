Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8E4154F699
	for <lists+kernel-janitors@lfdr.de>; Fri, 17 Jun 2022 13:23:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234937AbiFQLXE (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Fri, 17 Jun 2022 07:23:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230307AbiFQLXD (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 17 Jun 2022 07:23:03 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A8213FB2
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Jun 2022 04:23:02 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id y196so3918833pfb.6
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Jun 2022 04:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=Jh3M8LDovYWs/mBJiVJoI/DS8xun0EDDqspVSX/swmY=;
        b=hJELll0vaDrfPi6MM97AV7qaSQRzrjkLyiA5HNntKwvtDoWsSJ71sz1SU8F82vuqP4
         wgGE8B0pvbzmbnRB+RnPjbL/DbVBuA/73Glj4r+WSG0xgS7vkO+mf6mlNohmrJZDQfMC
         Pn1Kf7x09TAES8vZaPPDZrcjJBUAT9RaGrvjFX4fs63wVlxJ4gFTAwUNyA1uJOO9Eax4
         2LSW2sryh04JTnv2j163IwpQnaShwYiZW3t7Dt+o230onOT7P+cQULraFkGjl/HoyIuo
         fOGs5eMWKbh3q407ACh+osrn5s3JI6Gx0b5tJDNLlAw6zOJcMXTJ9BkpN1gcfaZH9cfa
         B8Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=Jh3M8LDovYWs/mBJiVJoI/DS8xun0EDDqspVSX/swmY=;
        b=G8X7l9+Nxls/KnkKGmDE82gC4plVy4LqJh8IWknmT6QGiBwxXIpoKnUhQulcVtlTCz
         CMn6xwZW2kTB/UBfRUqRbm6qVkOo+7dBk9KLkTXc7Hgvn7H1pc/7sum0CmnByxm29/RW
         p6fVjU2QImDBtBXu+exPjd0YQ40u51efcAb3vfVZSSyzNK4ZW2WCtR5LFeMo8KQUkt7n
         TDiw5oOR9pe6+oXmTEXIHBs4c1+S/XYxZP5IFBm4rjQagAg/W69oKKIUnzOoubQ5d3HB
         0x4JbdBozbYyYGUhKBsigOi4mWNaDoQPuBNyEA8YksUVFi2Lz5DsOYc8++VTRu8A+joR
         NxXA==
X-Gm-Message-State: AJIora8W5cxBMiT0JZUK2AQZn9LMzP5iPdeZvz2pbrIWfYtJAKsxLraM
        pgBF3wy09SJm4yzKgwo5hnB5AfnmVPbF9nhk+wo=
X-Google-Smtp-Source: AGRyM1tRa3bSgmftg63Q5UvPbGK8Ja21Bga7wwtdfiEuVcmGve0i8nXbOBoiZFgJvw+oTZ79zSHoarvhx7tjhYxtTn4=
X-Received: by 2002:a05:6a00:ac1:b0:4f1:29e4:b3a1 with SMTP id
 c1-20020a056a000ac100b004f129e4b3a1mr9454051pfl.63.1655464982370; Fri, 17 Jun
 2022 04:23:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7300:3049:b0:68:2a8f:e9f with HTTP; Fri, 17 Jun 2022
 04:23:01 -0700 (PDT)
Reply-To: rahmanahmadmrabdul02@gmail.com
From:   "Mr. Abdul Rahman Ahmad" <mawougnonkomla@gmail.com>
Date:   Fri, 17 Jun 2022 13:23:01 +0200
Message-ID: <CAHE5BpQSzy=-aRagHA9as59QXPbAivbUA2OYu3cKaLe01wZbtw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi   are you available to  speak now
Thanks
