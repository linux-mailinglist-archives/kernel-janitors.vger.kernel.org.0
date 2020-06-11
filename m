Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Original-To: lists+kernel-janitors@lfdr.de
Delivered-To: lists+kernel-janitors@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 675021F6F73
	for <lists+kernel-janitors@lfdr.de>; Thu, 11 Jun 2020 23:27:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbgFKV1e (ORCPT <rfc822;lists+kernel-janitors@lfdr.de>);
        Thu, 11 Jun 2020 17:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726153AbgFKV1d (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 11 Jun 2020 17:27:33 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BACCC08C5C1
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2020 14:27:33 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id l17so6315209wmj.0
        for <kernel-janitors@vger.kernel.org>; Thu, 11 Jun 2020 14:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=abkkHsN3VocrOpJOldWzz9PLA3MxanZ48f4YlmToeuc=;
        b=PcBWRXqdq4VXu1CIzPY7FXTdRaSxg+QZgaAdIG4qvZga4iebJfmCQ8KKRMEJa4zS/O
         ZLMXJvZow6xdIRYAYC+wYBQSD3ywb6TfbxpAigSU66uHYRQXyWFNdIu4PVVX/gVJckE8
         bbMQTABQJBP8uZuEeZVE3fivd1GGN45xVoadu6ITypiuoZRnELZnTd+X66eJtLfB7fII
         ESVEW3Zay3PX5u6L//2+Du02b5AAu9ki0LJ98E/Om6caYrwA0LLmlM8Ug/tskrJYugz5
         +Cc2dT0Jp8zcPQujoRGf1JYPsdLcZvzgWjzhoQ14c2GfotJFXf08TI7peARlO8KEZHFD
         oFyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=abkkHsN3VocrOpJOldWzz9PLA3MxanZ48f4YlmToeuc=;
        b=CKrlF/UI8qNx5lJpqrp65zwLzK9VCFvp8OZ4+g4IZZ3ICAGRdC0QN42kY8MamLOR2c
         miZBO9PS8QKn277wldHR0vcfdfzQqnn3OrJSN1Rke6IpfaFrFZKlEQhHMhqpNFeczLHV
         FS7tNYtaAkxZZSnAG5EjK3v0e258Bd6/7kW1UciXuAPyReTrrr652ks25Tn9+0TtlGd5
         iCJTmlanoJiyAqhJbl8mR6ZjnEIMmQURE0rI4JIHiKEtcakxgFoKjHuUFMLRJMobgzmY
         ZxwxwamknQnWLU4oQGcxe2xdUyGcBFajxcn/5jAc0E04uM5WbIRJjbmZuumz6qAULIcX
         sCbg==
X-Gm-Message-State: AOAM530rzePBC1L9GCMzwkkd9zAev3NqCzAGO7z3T2OmdSvhGXpex8go
        yfcVtDsuQgm+q95UJajEkbQ=
X-Google-Smtp-Source: ABdhPJz5RLoWFMELadplQekeZlNI7yTbU9ulAdJJNjxesRwFqaFCmar9EFSa9n6GfnYzjNRNDrnVVw==
X-Received: by 2002:a7b:c041:: with SMTP id u1mr10545054wmc.56.1591910851978;
        Thu, 11 Jun 2020 14:27:31 -0700 (PDT)
Received: from garrit-VirtualBox.fritz.box ([94.31.102.44])
        by smtp.gmail.com with ESMTPSA id s8sm6851427wrm.96.2020.06.11.14.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2020 14:27:31 -0700 (PDT)
From:   Garrit Franke <garritfranke@gmail.com>
To:     davem@davemloft.net, kuba@kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] sgi: remove unreachable debug output
Date:   Thu, 11 Jun 2020 23:27:15 +0200
Message-Id: <20200611212715.19231-1-garritfranke@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: kernel-janitors-owner@vger.kernel.org
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hi all,

this patch aims to replace the DPRINTK macro in meth.c with pr_debug
from kernel.h. I then removed a whole bunch of unreachable debug
outputs.

Thanks for your time,
Garrit

